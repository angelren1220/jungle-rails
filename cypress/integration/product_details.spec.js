describe("Product", () => {

  beforeEach(() => {
    cy.visit('/') 
    cy.get(".products article")
      .should("be.visible")
      .should("have.length", 2);
  })

  it("Navigate to product 1 and its details should be shown", () => {
    cy.contains('Giant Tea')
      .should("have.attr", "href", "/products/1")
      .click()
      .get(".products-show .product-detail")
      .should("be.visible")
      .contains('Giant Tea'); // check if the links to the correct product
  });
  
  it("Navigate to product 2 and its details should be shown", () => {
    cy.contains('Scented Blade')
      .should("have.attr", "href", "/products/2")
      .click()
      .get(".products-show .product-detail")
      .should("be.visible")
      .contains('Scented Blade'); // check if the links to the correct product
  });

});
