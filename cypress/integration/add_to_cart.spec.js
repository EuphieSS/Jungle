describe('product details page', () => {

  it('Visit the homepage', () => {
    cy.visit('http://localhost:3000/');
  });

  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("Add product to cart when click on 'Add' button, and cart count increases", () => {
    cy.visit('http://localhost:3000/');
    cy.contains("My Cart (0)");
    cy.contains("Add").first().click({force: true});
    cy.contains("My Cart (1)");
  });

});