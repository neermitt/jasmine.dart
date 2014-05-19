library jasmine;


abstract class SpecVisitor {
  void visitRootSpec(SpecContext context);
}

abstract class SpecContext {

  get description => 'group 1';

  void accept(SpecVisitor visitor);
}

class GroupSpecContext implements SpecContext {

  String _description;
  List<SpecContext> _children = new List();

  GroupSpecContext(this._description);

  get description => _description;

  void add(SpecContext context) {
    _children.add(context);
  }

  void accept(SpecVisitor visitor) {

  }

}

class SpecManager extends GroupSpecContext {

  SpecManager() : super('root');

  void accept(SpecVisitor visitor) {
    visitor.visitRootSpec(this);
  }

  Iterable<SpecContext> get children => _children;

  void clear() {
    _children.clear();
  }
}


class Jasmine {
  var _specManager = new SpecManager();

  SpecManager get specManager => _specManager;

  void reset() {
    _specManager.clear();
  }

}


Jasmine jasmine = new Jasmine();



describe(String groupDescription, Function describedBy) {
  jasmine.specManager.add(new GroupSpecContext(groupDescription));
}