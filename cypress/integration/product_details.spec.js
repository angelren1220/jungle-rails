describe("Product", () => {

  beforeEach(() => {
    cy.visit('/') 
    cy.get(".products article")
      .should("be.visible")
      .should("have.length", 2);
  })

  it("Navigate to product 1 and its details should be shown", () => {
    cy.contains('Giant Tea')
      .click()
      // check if the links to the correct product
      .location('pathname').should('eq', '/products/1')
      .get(".products-show .product-detail")
      .should("be.visible")
      .contains('Giant Tea');
  });
  
  it("Navigate to product 2 and its details should be shown", () => {
    cy.contains('Scented Blade')
      .click()
      // check if the links to the correct product
      .location('pathname').should('eq', '/products/2')
      .get(".products-show .product-detail")
      .should("be.visible")
      .contains('Scented Blade');
  });

});
