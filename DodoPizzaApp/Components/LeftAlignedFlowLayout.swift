//
//  Untitled.swift
//  DodoPizzaApp
//
//  Created by Kateryna on 06/08/2025.
//
import UIKit

/// A flow-layout that left-aligns every new row of auto-sized cells.
final class LeftAlignedFlowLayout: UICollectionViewFlowLayout {

    override func layoutAttributesForElements(in rect: CGRect)
    -> [UICollectionViewLayoutAttributes]? {

        guard let attrs = super.layoutAttributesForElements(in: rect) else { return nil }

        // Work on a copy so we don’t mutate the originals returned by super.
        var leftAligned = [UICollectionViewLayoutAttributes]()
        var leftMargin = sectionInset.left
        var currentY: CGFloat = -1.0

        for attr in attrs {
            guard attr.representedElementCategory == .cell else {
                leftAligned.append(attr)         // headers / footers untouched
                continue
            }

            if attr.frame.origin.y > currentY { // starting a new row
                leftMargin = sectionInset.left
                currentY   = attr.frame.origin.y
            }

            var frame = attr.frame
            frame.origin.x = leftMargin
            attr.frame = frame

            leftMargin += frame.width + minimumInteritemSpacing
            leftAligned.append(attr)
        }
        return leftAligned
    }
}
