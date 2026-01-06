# Flutter Developer Portfolio

A modern, responsive, and customizable developer portfolio built with Flutter, [View it Here.](https://moazsalem.github.io/portfolio/)

## Features
- 🎨 **Modern Design**: Clean and professional UI with smooth animations.
- 📱 **Fully Responsive**: Optimized for Web, Mobile, and Desktop.
- 🛠 **Easy Customization**: All content is centralized in one file for easy editing.
- ⚡ **High Performance**: Built with Flutter for smooth rendering.

## Getting Started

### Prerequisites
- [Flutter SDK](https://docs.flutter.dev/get-started/install) installed.

### Installation
1.  **Clone the repository:**
    ```bash
    git clone https://github.com/MoazSalem/portfolio.git
    cd portfolio
    ```

2.  **Install dependencies:**
    ```bash
    flutter pub get
    ```

3.  **Run the project:**
    ```bash
    flutter run -d chrome
    ```

## 🛠 Customization Guide ("Make it Yours")

This portfolio is designed to be easily adaptable for your own use. You don't need to dig through widget trees to change the content!

**All personal data is located in a single file:**
📂 `lib/core/constants/user.dart`

1.  Open `lib/core/constants/user.dart`.
2.  Update the `User` object with your details:
    - **Introduction**: Name, tagline, description, avatar.
    - **Social Links**: GitHub, LinkedIn, Resume, etc.
    - **Education**: University, degree, dates.
    - **Experience**: Work history and responsibilities.
    - **Projects**: List of your showcased projects with images, tags, and links.
3.  Clean up: Replace `assets/images/avatar.webp` with your own photo and update project images in `assets/images/previews/`.

## 📄 License & Attribution

You are free to use this code for your own portfolio, modify it, and learn from it.

**Requirement:**
> [!NOTE]
> If you use this project, you **must keep the credit to the original author (Moaz Salem)** or provide a clear link back to this repository in your specific portfolio or README.

A simple "Design/Code by [Moaz Salem](https://github.com/MoazSalem)" in the footer or About section is appreciated!
