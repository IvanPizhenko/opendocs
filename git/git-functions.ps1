function gitwip
{
	git status
	git add -u
	git commit -m wip
	git push
	date
}

function gitfix
{
	git status
	git add -u
	git commit -m fix
	git push
	date
}
