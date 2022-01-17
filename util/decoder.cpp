#include <bits/stdc++.h>

using namespace std;

string error = "dsalk;kdl;sak;ldksal;kdlaskl;kigherhuigherighisdkjhf218409349082390jcsdjfksdjk";

string get(const string& s, int position) {
  int first = s.find("<pre>", position);
  int second = s.find("</pre>", position);
  if ((first == -1) || (second == -1)) {
    return error;
  }
  first += 5;
  second -= 1;
  return s.substr(first, second - first + 1);
}

pair<string, string> search(string& s) {
  int positionInput = s.find("class=\"input\"");
  int positionOutput = s.find("class=\"output\"");
  if ((positionInput == -1) || (positionOutput == -1)) {
    return make_pair(error, error);
  }
  string resultInput = get(s, positionInput);
  string resultOutput = get(s, positionOutput);
  if ((resultInput == error) || (resultOutput == error)) {
    return make_pair(error, error);
  }
  if (s.size() <= 19 + positionOutput) {
    throw "too small string";
  }
  s = s.substr(positionOutput + 19, s.size() - (positionOutput + 19));
  return make_pair(resultInput, resultOutput);
}

int main() {
  freopen("content.html", "r", stdin);
  string s, x;
  while (getline(cin, x)) {
    s += x;
    s += "\n";
  }
  auto current = search(s);
  int count = 1;
  while (current.first != error) {
    cerr << "create: " << count << " of " << char(64 + NUMBER_OF_PROBLEM) << "\n";
    string path = "../";
    path.push_back(char(96 + NUMBER_OF_PROBLEM));
    freopen((path + "/in" + to_string(count)).c_str(), "w", stdout);
    cout << current.first;
    freopen((path + "/out" + to_string(count)).c_str(), "w", stdout);
    cout << current.second;
    current = search(s);
    ++count;
  }
  return 0;
}
