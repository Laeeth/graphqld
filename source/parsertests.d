module parsertests;

import lexer;
import parser;

unittest {
	string s = 
`{
  query name {
	  foo
  }
}`;
	auto l = Lexer(s);
	auto p = Parser(l);
	auto d = p.parseDocument();
}

unittest {
	string s = `
{
  query human() {
    name
    height
  }
}`;
	auto l = Lexer(s);
	auto p = Parser(l);
	auto d = p.parseDocument();
}

unittest {
	string s = `
{
  query human(id: "1000") {
    name
    height
  }
}`;
	auto l = Lexer(s);
	auto p = Parser(l);
	auto d = p.parseDocument();
}

unittest {
	string s = `
{
  query human(id: 1000, limit: 3, gender: "male") {
    name!
    height
	friends {
		id!
		gender
		income
	}
  }
}`;
	auto l = Lexer(s);
	auto p = Parser(l);
	auto d = p.parseDocument();
}

unittest {
	string s = `{
query {
	name
    builds
  }
 }
`;
	auto l = Lexer(s);
	auto p = Parser(l);
	auto d = p.parseDocument();
}

unittest {
	string s = `
{
query {
	name
    builds(first: 1) {
  }
 }
`;
	auto l = Lexer(s);
	auto p = Parser(l);
	auto d = p.parseDocument();
}

unittest {
	string s = `
{
query {
  viewer {
    user {
      name
      builds(first: 1) {
        edges {
          node {
            number
            branch
            message
          }
        }
      }
    }
  }
}
`;
	auto l = Lexer(s);
	auto p = Parser(l);
	auto d = p.parseDocument();
}
