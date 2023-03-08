const { Template, template_method} = require('../src/template.js');

describe('Template testing...', () => {
    test('should be a Template class...', () => {
      const template = new Template();
      expect(template).toBeDefined();
    });
    test('should be a template_method method...', () => {
      expect(template_method()).toEqual('Hello world');
    });
  });