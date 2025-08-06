# 🍕 Dodo Pizza Clone

> **Unofficial, educational replica** of the Dodo Pizza iOS application — built 100 % with **UIKit** and fully programmatic `UIView` layouts (no Storyboards, no XIBs). Powered by a lightweight mock backend with **Macoon**.

---

## 📸 Screens in v0.1.0

| Screen | Description |
|--------|-------------|
| **Main Menu** | Product grid (pizzas, snacks, drinks) + horizontal banner carousel |
| **Product Detail** | Full product profile: gallery, description, size picker, “Add to cart” CTA |
| **Banner Detail** | Expands promo banner info and links to current offers |

---

## 🔧 Tech Stack

| Layer | Tech | Notes |
|-------|------|-------|
| **UI** | UIKit + Auto Layout | Pure-code constraints via anchors / `NSLayoutConstraint` |
| **Networking** | Macoon | Local JSON API mock (`api/macoon.yaml`) |
| **Reactive** | Combine | One-way data flow |
| **Build** | Swift 5.10 · Xcode 16 · iOS 17+ | SPM only—no external UI kits |

---

## ✨ Why this project exists

1. **Hands-on UIKit** in a SwiftUI era.  
2. **Programmatic discipline** — crystal-clear view hierarchies.  
3. **e-Commerce patterns** — menus, variants, banners, modals.  
4. **Offline-first development** with Macoon-mocked endpoints.

---

## 🚀 Getting Started

```bash
# 1. Clone
git clone https://github.com/your-username/dodo-pizza-clone.git
cd dodo-pizza-clone

# 2. Install mock server (first time only)
brew install macoon

# 3. Launch mock API (http://localhost:8080)
macoon serve --config api/macoon.yaml

# 4. Open & run
open DodoPizzaClone.xcodeproj   # or .xcworkspace
# ⌘R in Xcode
