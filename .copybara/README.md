[Copybara][copybara] configuration used to sync the private repo with the
public one, excluding personal files I do not want to share with the world :)

## How to test the Copybara script

1. Clone the private and public repos in your computer.
2. Create a `test_repos_config.bara.sky` based in the template
`test_repos_config.bara.sky.template`.
3. Run `sh export-commits-test.sh`.

[copybara]: https://github.com/google/copybara
