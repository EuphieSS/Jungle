describe('product details page', () => {

  it('Visit the homepage', () => {
    cy.visit('http://localhost:3000/');
  });

  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("Visit the product details page when click on the product", () => {
    cy.visit('http://localhost:3000/');
    cy.get(".products article").first().click();
    cy.contains(".product-detail", "Cliff Collard");
  });

});