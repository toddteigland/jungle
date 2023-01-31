describe('Jungle', () => {

  it('displays the page', () => {
    cy.visit('localhost:3000')
  });

  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("Adds a product to the cart", () => {
    cy.get('.btn').click( {force: true})
    cy.contains('My Cart (1)').should('exist')
    })


})
