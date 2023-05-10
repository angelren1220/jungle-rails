describe("User", () => {

  beforeEach(() => {
    cy.visit('/');

  });


  it('Logs in the user with matching email and password and redirects user to home page', () => {

    // login page
    cy.contains('Login')
      .click()
      .location('pathname').should('eq', '/login');

    // fill in the form and check user authentication
    cy.get('[name="email"]').type('linxueren@mail.com');
    cy.get('[name="password"]').type('password');
    cy.get('[name=commit]')
      .click() // redirects to home page and welcome message shown on home page
      .location('pathname').should('eq', '/');
    cy.contains('Hello, Linxue');

  });

  it('Creates a new user and logs in the user', () => {

    // signup page
    cy.contains('Signup')
      .click()
      .location('pathname').should('eq', '/signup');

    // create a user with filling form
    cy.get('[name="user[first_name]"]').type("Oreo", { force: true });
    cy.get('[name="user[last_name]"]').type("Cat");
    cy.get('[name="user[email]"]').type('oreocat@mail.com');
    cy.get('[name="user[password]"]').type('password');
    cy.get('[name="user[password_confirmation]"').type('password');
    cy.get('[name=commit]')
      .click() // redirects to home page and welcome message shown on home page
      .location('pathname').should('eq', '/');
    cy.contains('Hello, Oreo!');


  });


});