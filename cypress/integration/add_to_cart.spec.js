describe("Cart", () => {

  it("At home page: product is added to Cart and the cart should be increased by 1 ", () => {
    cy.visit('/');
    // My cart originally has 0 item
    cy.get('nav')
      .contains('My Cart (0)');

    // Add one item
    cy.get('button')
      .contains('Add')
      .click({ force: true });

    // My cart has been added 1 item
    cy.get('nav')
      .contains('My Cart (1)');
  });

  it("At product page: product added to Cart and the cart should be increased by 1 ", () => {
    // click to visit product page
    cy.visit("/products/1");

    // My cart originally has 0 item
    cy.get('nav')
      .contains('My Cart (0)');

    // Add one item
    cy.get('button')
      .contains('Add')
      .click({ force: true });

    // My cart has been added 1 item
    cy.get('nav')
      .contains('My Cart (1)');

    cy.visit("/products/2");
    // My cart originally has 1 item
    cy.get('nav')
      .contains('My Cart (1)');

    // Add one item
    cy.get('button')
      .contains('Add')
      .click({ force: true });

    // My cart has been added 2 items
    cy.get('nav')
      .contains('My Cart (2)');
  });

});