function gitwip
{
	git status
	git add -u
	git commit -m wip
	git push

	Write-Output ""
	date
	Write-Output "Operation completed."
}

function gitwip2
{
	git status
	git add -u
	git commit -m wip

	Write-Output ""
	date
	Write-Output "Operation completed."
}

function gitfix
{
	git status
	git add -u
	git commit -m fix
	git push

	Write-Output ""
	date
	Write-Output "Operation completed."
}

function gitfix2
{
	git status
	git add -u
	git commit -m fix
	git push


	Write-Output ""
	date
	Write-Output "Operation completed."
}
