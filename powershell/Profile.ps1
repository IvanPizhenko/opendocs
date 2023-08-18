function gitwip
{
	git status
	git add -u
	git commit -m wip
	git push
  get-date
}

function gitfix
{
	git status
	git add -u
	git commit -m fix
	git push
  get-date
}
