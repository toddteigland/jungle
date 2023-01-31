describe("Jungle", () => {

  it("displays the page", () => {
    cy.visit("localhost:3000");
  });

  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("Clicks on the first product", () => {
    cy.get('a[href*="/products/2"]').click()
    cy.location().should((location) => {
      expect(location.pathname).to.eq('/products/2')
    })
  })

});
