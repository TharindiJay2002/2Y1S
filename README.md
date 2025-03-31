# 2Y1S Project Documentation

![2Y1S Project](https://via.placeholder.com/1200x400/2D3748/FFFFFF?text=2Y1S+Project+Documentation)

This repository contains project files and documentation for **2Y1S**, maintained by Tharindi Jay.

## 📑 Table of Contents
- [Repository Structure](#-repository-structure)
- [Getting Started](#-getting-started)
- [Java Code Explanation](#-java-code-explanation)
- [Contribution Guidelines](#-contribution-guidelines)
- [Maintainers](#-maintainers)
- [License](#-license)

## 📂 Repository Structure
```
2Y1S/
├── OOP/                # Object-Oriented Programming projects
│   └── MusicStore/     # Music Store application
├── SE/                 # Software Engineering materials
├── .gitattributes      # Git attributes configuration file
├── LICENSE             # License file
└── README.md           # Project documentation file
```

## 🚀 Getting Started

### Prerequisites
- Java Development Kit (JDK)
- Integrated Development Environment (IDE) such as Eclipse or IntelliJ IDEA
- Git
- Markdown viewer (for `.md` files)

### Installation
1. Clone the repository:
   ```bash
   git clone https://github.com/TharindiJay2002/2Y1S.git
   ```
2. Navigate to the project directory:
   ```bash
   cd 2Y1S
   ```

## 🔍 Java Code Explanation

### `OOP/MusicStore/`

The `MusicStore` directory contains a Java application that simulates a music store's operations. Below is an overview of key components:

- **`MusicStore.java`**: The main class that initializes the application and manages the overall workflow.

- **`Product.java`**: An abstract class representing a generic product in the store. It includes attributes such as `id`, `name`, `price`, and methods like `getDetails()`.

- **`Instrument.java`**: A subclass of `Product` that represents musical instruments. It adds specific attributes like `type` (e.g., string, percussion) and overrides the `getDetails()` method to include instrument-specific information.

- **`Album.java`**: Another subclass of `Product` representing music albums. It includes attributes like `artist`, `genre`, and `releaseYear`, and provides its own implementation of `getDetails()`.

- **`Customer.java`**: A class that models a customer with attributes such as `customerId`, `name`, and `email`. It includes methods to retrieve customer information.

- **`Order.java`**: This class manages orders placed by customers. It contains attributes like `orderId`, `customer`, `productList`, and methods to calculate the total order value and display order details.

- **`Inventory.java`**: A class that maintains the store's inventory, including methods to add, remove, and search for products. It ensures that stock levels are updated appropriately.

- **`MusicStoreApp.java`**: The entry point of the application containing the `main` method. It sets up the store, adds sample data, and provides a simple text-based user interface for interacting with the store.

These classes demonstrate principles of object-oriented programming such as inheritance, encapsulation, and polymorphism, providing a foundational structure for the Music Store application.

## 🤝 Contribution Guidelines
1. Fork the repository.
2. Create a new branch:
   ```bash
   git checkout -b feature/your-feature-name
   ```
3. Commit your changes:
   ```bash
   git commit -m "Add your meaningful commit message"
   ```
4. Push to your branch:
   ```bash
   git push origin feature/your-feature-name
   ```
5. Open a Pull Request.

## 👥 Maintainers
**Tharindi Jay**  
🔗 [GitHub Profile](https://github.com/TharindiJay2002)

## 📜 License
This project is licensed under the MIT License - see the LICENSE file for details.

---
**Documentation last updated: March 2025**  
Project maintained by Tharindi Jay.
