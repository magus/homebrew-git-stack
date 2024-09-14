class GitStackAT183 < Formula
  desc "Stacked diffs for git"
  homepage "https://github.com/magus/git-stack-cli"
  version "1.8.3"

  if OS.mac?
    url "https://github.com/magus/git-stack-cli/releases/download/1.8.3/git-stack-cli-macos"
    sha256 "361e06f4b93b8db9c2c1675854ef3cc12301fbff7ca753cd1d56d47ded1a5506"
  elsif OS.linux?
    url "https://github.com/magus/git-stack-cli/releases/download/1.8.3/git-stack-cli-linux"
    sha256 "dabceb8009ed3a5859196eb05d7b4ecbba27f9733c5b359eaebaeba6eec05942"
  end

  # official Github CLI
  # https://cli.github.com/
  depends_on "gh"

  # git revise for faster, in-memory rebasing
  # https://github.com/mystor/git-revise
  depends_on "git-revise"

  def install
    bin.install "git-stack-cli-macos" => "git-stack" if OS.mac?
    bin.install "git-stack-cli-linux" => "git-stack" if OS.linux?
  end

  test do
    assert_match version, shell_output("#{bin}/git-stack --version")
    assert_match "Must be run from within a git repository.", shell_output("#{bin}/git-stack 2>&1", 9)
  end
end
