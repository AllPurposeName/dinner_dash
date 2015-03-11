Benchmark Timeline:

Wednesday: Data began-complete
Thursday: Login/Cats/Cart began
Saturday: Login/Cats/Cart complete | Admin Order began
Tuesday: Admin Order complete | Restrictions began
Wednesday: Restrictions complete | FrontEnd began-complete

Team Practices:

Rspec test suite
Double Quotations ""
Bootstrap CSS naming
On spec use "Within '/.class/'" whenever possible
  We will shovel bootstrap classes on.
Edit sample data on Data-branch
Touch base before touching foreign files
All buttons, links, etc. lower-case only
Styling we do upcase for those

Branch naming:
015_user_can_login_master
issue number, issue name, branch branched from

Pull requests:
Before merging, everyone should comment.
Reviewer merges and moves waffle.
Delete the branch unless data-branch

Git Commit:
git commit -m "{title}Updated user model with relationship statuses. {shift+enter}
{shift+enter (if anything goes wrong and you want to jump back a line, press ctrl+c and then up arrow)}

{description}Added belongs_to for order and has_many for id. I did this because the test froze up on 'relationship doesnt exist'. This made the test pass. The next step is to write a test covering validations."
