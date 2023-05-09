describe("Product", () => {

  beforeEach(() => {
    cy.visit('/') 
    cy.get(".products article")
      .should("be.visible")
      .should("have.length", 2);
  })

  it("At home page: product is added to Cart and the cart should be increased by 1 ", () => {
    // My cart originally has 0 item
    cy.get('nav')
      .contains('My Cart (0)');

    // Add one item
    cy.get('button')
      .contains('Add')
      .click({force: true})
    
    // My cart has been added 1 item
    cy.get('nav')
      .contains('My Cart (1)');
  });

});