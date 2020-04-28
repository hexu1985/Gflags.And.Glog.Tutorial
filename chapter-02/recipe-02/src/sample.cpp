#include <gflags/gflags.h>
#include <iostream>

using namespace std;

DEFINE_bool(big_menu, true, "Include 'advanced' options in the menu listing");
DEFINE_string(languages, "english,french,german", "comma-separated list of languages to offer in the 'lang' menu");

int main(int argc, char **argv) {
  gflags::ParseCommandLineFlags(&argc, &argv, true);

  cout << "argc=" << argc << endl;
  if (FLAGS_big_menu) {
    cout << "big menu is ture" << endl;
  } else {
    cout << "big menu is flase" << endl;
  }

  cout << "languages=" << FLAGS_languages << endl;
  return 0;
}

