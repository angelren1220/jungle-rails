# Jungle

A mini e-commerce application built with Rails 6.1. It includes bug fixes, UI changes, and new features that enhance the user experience.

- Bug fixes:
  - Money formatting: unified money formatting accross the site
  - Missing admin security: require admin username and password to access admin pages

- UI changes:
  - Display a message and link to home page if cart is empty instead of cart details with any data
  - Display a "Sold Out" badge for items with no inventory
  - Display details of the order after an order was placed successfully

- Features:
  - Add an admin dashboard with overview of the number of products and categories
  - Add an About page, that can be filled with data about the company
  - Add a new page for admins to create new categories
  - Add new databases and pages to support user login and registration
    - passwords are properly hashed with bcrypt
    - emails must be unique and are case insensitive
    - display error messages for login/signup pages

- Tests:
  - RsSpec tests for product and user models
  - Cypress tests for home page, product details, add to cart and user login/signup

# Results
- Admin login
![](https://github.com/angelren1220/jungle-rails/blob/master/docs/admin-login.png)

- Soldout badge
![](https://github.com/angelren1220/jungle-rails/blob/master/docs/sold-out-badge.png)

- Product detail
![](https://github.com/angelren1220/jungle-rails/blob/master/docs/product-detail.png)

- Invalid login
![](https://github.com/angelren1220/jungle-rails/blob/master/docs/error-message-invalid-login.png)

- Checkout order summary
![](https://github.com/angelren1220/jungle-rails/blob/master/docs/guest-checkout.png)


## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Start psql services and Run `bin/rails db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Database

If Rails is complaining about authentication to the database, uncomment the user and password fields from `config/database.yml` in the development and test sections, and replace if necessary the user and password `development` to an existing database user.

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

- Rails 6.1 [Rails Guide](http://guides.rubyonrails.org/v6.1/)
- Bootstrap 5
- PostgreSQL 9.x
- Stripe
