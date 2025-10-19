#include <unistd.h>
#include <stdlib.h>

int main(int argc, char *argv[])
{
  setuid(geteuid());   
  execv("/usr/local/bin/fix-network.sh", argv);
  return 1;
}
