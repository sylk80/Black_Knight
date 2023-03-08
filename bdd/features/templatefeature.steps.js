/* eslint-disable new-cap */
const {
    Given,
    When,
    Then,
    Fusion,
} = require("jest-cucumber-fusion")

const { template_method } = require('../../src/template')

let greeting

Given('the cookiecutter template', () => {})

When('the repository is referenced with cookiecutter', () => {
    greeting = template_method() 
})

Then('it should clone and create a template project locally', () => {
    expect(greeting).toBe("Hello world") 
})

Fusion("template.feature")



