part of jasmine.test;

class MockSpecVisitor extends Mock implements SpecVisitor {

}

void testInterface() {
  group('describe', () {

    tearDown((){
      jasmine.reset();
    });

    test('creates spec Manager', () {
      describe('group 1', () {
      });

      expect(jasmine.specManager, isNotNull);
      expect(jasmine.specManager, new isInstanceOf(SpecContext));

      var mockVisitor = new MockSpecVisitor();
      jasmine.specManager.accept(mockVisitor);

      mockVisitor.getLogs(callsTo('visitRootSpec', anything)).verify(happenedExactly(1));

    });

    test('creates spec Group in spec manager', () {
      describe('group 1', () {
      });

      expect(jasmine.specManager.children.length, 1);
      expect(jasmine.specManager.children.elementAt(0).description, 'group 1');
    });

    test('creates multiple spec Group in spec manager', () {
      describe('group 1', () {
      });

      describe('group 2', () {
      });

      expect(jasmine.specManager.children.length, 2);
      expect(jasmine.specManager.children.elementAt(0).description, 'group 1');
      expect(jasmine.specManager.children.elementAt(1).description, 'group 2');
    });

  });
}