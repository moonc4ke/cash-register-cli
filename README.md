# Cash Register Application

This application simulates a cash register through a command-line interface (CLI), allowing users to add products to a cart and calculate the total price with applicable discounts.

## Getting Started

These instructions will guide you through setting up and running the cash register application on your local machine.

### Prerequisites

Ensure you have Ruby installed on your machine. You can check your Ruby version by running:

```
ruby -v
```

If Ruby is not installed, follow the [official Ruby installation guide](https://www.ruby-lang.org/en/documentation/installation/) to set it up.

### Installation

1. **Clone the Repository**

   To get started, clone the project repository to your local machine:

   ```
   git clone https://github.com/moonc4ke/cash-register-cli.git
   ```

2. **Navigate to the Project Directory**

   ```
   cd cash-register-cli
   ```

## Running the Application

To run the cash register application, execute the following command in the terminal:

```
ruby bin/run
```

Follow the on-screen prompts to add products to the cart. Enter the product code as instructed (GR1, SR1, or CF1), or type `done` to finish and see the total price of the cart.

### Adding Products

The application supports adding the following products:

- Green Tea (Code: GR1)
- Strawberries (Code: SR1)
- Coffee (Code: CF1)

## Testing

Ensure that all tests pass to verify the application is working correctly. Run the following command from the root of the project to execute the test suite:

```
ruby bin/run_tests.rb
```

This command runs a custom script `run_tests.rb` that executes all test files in the `test` directory.

## Extending the Application

Enhance functionality with new products and maintain code quality through testing:

- **Instantiate New Products**: Add new products by creating instances of the `Product` class. For instance:

  ```ruby
  # In your product management context:
  black_tea = Product.new(code: 'BT1', name: 'Black Tea', price: 2.50)
  ```

- **Adding Unit Tests**: Ensure to write tests for any new functionality. Here's a concise example for testing a new product:

  ```ruby
  require 'minitest/autorun'
  require_relative '../lib/product'

  class ProductTest < MiniTest::Test
    def test_black_tea_initialization
      black_tea = Product.new(code: 'BT1', name: 'Black Tea', price: 2.50)
      assert_equal 'BT1', black_tea.code
      assert_equal 'Black Tea', black_tea.name
      assert_equal 2.50, black_tea.price
    end
  end
  ```

- **Modify Discount Rules**: Adapt `lib/discount.rb` for new products or changes in discounts, testing each adjustment.

This approach ensures your application's functionality can grow while remaining robust and tested.

