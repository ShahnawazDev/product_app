# Product App

## Overview

The Product App is a Flutter-based application designed to display a list of products, provide details about each product, and manage a shopping cart. This application showcases key Flutter skills, including state management, UI/UX design, and responsiveness.

## Features

1. **Product Listing**
   - Displays a list of products with their names, images, and prices.
   - Products are sourced from a JSON file but can be fetched from REST api with minimal changes.
   - Includes a search bar to filter products by name.

2. **Product Details**
   - Users can tap on a product to view a detailed screen.
   - The detail view includes the product's name, image, description, and price.

3. **Cart**
   - A cart icon displays the count of items in the cart.
   - Products can be added to the cart from the product detail page.
   - A dedicated cart screen shows items, their quantities, and the total price.
   - Users can remove items from the cart.

4. **UI**
   - Features a clean, responsive, and user-friendly interface.

## Bonus Features 

- **State Management**: Uses Bloc state management solution.
- **Persistent Storage**: Implements persistent storage using SharedPreferences.

## Project Structure

```
lib
|   main.dart
|   output.doc
|   routes.dart
|   
+---core
|   +---models
|   |       product_model.dart
|   |       
|   +---theme
|   |       app_theme.dart
|   |       colors.dart
|   |       text_styles.dart
|   |       
|   \---utils
|           product_service.dart
|           shared_preferences_service.dart
|           
\---features
    +---cart
    |   +---bloc
    |   |       cart_bloc.dart
    |   |       cart_event.dart
    |   |       cart_state.dart
    |   |       
    |   +---models
    |   |       cart_model.dart
    |   |       
    |   +---screens
    |   |       cart_screen.dart
    |   |       
    |   \---widgets
    |           cart_list_tile.dart
    |           
    \---product_mangement
        +---blocs
        |   +---product_detail_bloc
        |   |       product_detail_bloc.dart
        |   |       product_detail_event.dart
        |   |       product_detail_state.dart
        |   |       
        |   \---product_list_bloc
        |           product_list_bloc.dart
        |           product_list_event.dart
        |           product_list_state.dart
        |           
        +---repositories
        |       product_repository.dart
        |       
        +---screens
        |       product_detail_screen.dart
        |       product_list_screen.dart
        |       
        \---widgets
                cart_icon.dart
                product_card.dart
```

## Setup Instructions

1. **Clone the Repository**

   ```bash
   git clone <repository_url>
   ```

2. **Navigate to the Project Directory**

   ```bash
   cd product_app
   ```

3. **Install Dependencies**

   Ensure you have Flutter installed. Then run:

   ```bash
   flutter pub get
   ```

4. **Run the Application**

   To run the application on an emulator or physical device:

   ```bash
   flutter run
   ```

## Code Quality

The code follows best practices for cleanliness, organization, and maintainability. Comments are included where necessary to explain functionality.

## Evaluation Criteria

- **Code Quality**: Cleanliness and organization of the code.
- **Functionality**: Implementation and correctness of features.
- **UI/UX**: Design and usability of the interface.
- **Problem-Solving**: Handling of challenges and implementation of bonus features.

## Contributing

Feel free to open issues or submit pull requests if you have suggestions or improvements.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
