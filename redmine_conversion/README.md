# Converting a Redmine site to GitHub

CEMAC helped convert the SEE GLAM red mine site to a GitHub organisation, this is a write up to the steps involved

:warning: this page still contains glam References and will in the future be generised :warning:

## Creating a Host GitHub Organisation

## Converting a SVN repository to a git repo

*depending on the permissions set up you may need extra permissions to perform this step*

following the information given [here](https://john.albin.net/git/convert-subversion-to-git)

1. `svn checkout https://see.leeds.ac.uk/svn/glamleeds`
2. `cd glamleeds`
3. `svn log -q | awk -F '|' '/^r/ {sub("^ ", "", $2); sub(" $", "", $2); print $2" = "$2" <"$2">"}' | sort -u > authors-transform.txt`
  a. Edit authors-transform.txt from jwilkins = jwilkins <jwilkins> to jwilkins = jwilkins <jwilkins@example.com>
  b. If that email has an associated github account then the commits will be associated with that account
4. `mkdir ../temp`
The glam repo has a none standard layout so you must tell it truck tags and branches
There is also a crazy tag creation error r515-r514 (in revision comments: safe to skip) so this has to be split in 2. The standalone glam folder must be treated separately
5. `git svn clone https://see.leeds.ac.uk/svn/glamleeds/  --no-metadata --trunk=/trunk --branches=/developers/* --tags=/tags/* -A authors-transform.txt ../../temp/ -r 0:515`
6. `git svn clone https://see.leeds.ac.uk/svn/glamleeds/  --no-metadata --trunk=/trunk --branches=/developers/* --tags=/tags/* -A authors-transform.txt ../../temp/ -r 515:HEAD`
Glam gives some weird perl permission error trying to convert the svn ignore, so ignored the step to convert svn ignore (can do manually)
7. `git init --bare ../new-bare.git`
8. `cd ../new-bare.git`
9. `git symbolic-ref HEAD refs/heads/trunk`
10. `cd ../temp`
11. `git remote add bare ../new-bare.git`
12. `git config remote.bare.push 'refs/remotes/*:refs/heads/*'`
13. `git push bare`
14. `cd ../new-bare.git`
15. `git branch -m trunk master`
16.
```bash
git for-each-ref --format='%(refname)' refs/heads/tags |
cut -d / -f 4 |
while read ref
do
  git tag "$ref" "refs/heads/tags/$ref";
  git branch -D "tags/$ref";
done
```
17. Create a blank private repo in glam leeds`
18. `git remote add origin git@github.com:GLAM-Leeds/glamleeds.git`
19. `git push --all origin`
20. `git push --tags origin`
So we need to do this separately for the glam folders

21. `rm -rf ../temp ../new-bare.git`
22.`` git svn clone https://see.leeds.ac.uk/svn/glamleeds/  --no-metadata --trunk=/glam -A authors-transform.txt ../../temp/ `
Glam gives some weird perl permission error trying to convert the svn ignore, so ignored the step to convert svn ignore (can do manually)
23. `git init --bare ../new-bare.git`
24. `cd ../new-bare.git`
25. `git symbolic-ref HEAD refs/heads/trunk`
26. `cd ../temp`
27. `git remote add bare ../new-bare.git`
28. `git config remote.bare.push 'refs/remotes/*:refs/heads/*'`
29. `git push bare`
30. `cd ../new-bare.git`
31. `git branch -m trunk master`
32.

```bash
git for-each-ref --format='%(refname)' refs/heads/tags |
cut -d / -f 4 |
while read ref
do
  git tag "$ref" "refs/heads/tags/$ref";
  git branch -D "tags/$ref";
done
```

33. Create a blank private repo in glam leeds
34. `git remote add origin git@github.com:GLAM-Leeds/glamleeds-glam.git`
35. `git push --all origin`
36. `git push --tags origin`



## Converting Redmine textile Wiki to GitHub MarkDown

1. login to Redmine page
2. Collect .txt file names
  a. If a site map exists copy a list of all pages and file paths from the wiki section
  b. If no site map exists, put on a film and collect each page name by clicking through the whole
  site, files in the file section will need the whole file path as they have a less generic path
3. Replace any spaces with underscores
4. replace the names in the `Wikipages` string array with in `get_all.sh` with the page names
5. run `./get_all.sh`
6. you should now have a bunch of .txt files. additional files must be added separately by using full paths such as
    a. redmine/public/attachments/<ID>/<filename>
7. install pandoc or use machine with pandoc installed and run `./convert_to_md.sh`

## Creating Wiki

1. in the desired repo create the first generic wiki pages
2. clone the wiki git clone git@github.com:<organisation>/<reponame>.wiki.git
3. cd into repo and copy the create md files and any addtional files into that directory
4. rename index page `mv Index.md Home.md`
5. install `rename` and run `find . -name "*_*" -type f | rename 's/_/ /g'`
6. `git add .` `git commit -am ':tada: upload old wiki'` `git push`
7. The raw wiki will now appear
8. If the wiki is big then you may wish to Tidy up nav bar
