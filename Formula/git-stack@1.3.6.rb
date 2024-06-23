class GitStackAT136 < Formula
  desc "Stacked diffs for git"
  homepage "https://github.com/magus/git-stack-cli"
  version "1.3.6"

  if OS.mac?
    url "https://github.com/magus/git-stack-cli/releases/download/1.3.6/git-stack-cli-macos"
    sha256 "5338db5f3c340c2c56f22934bc5fc4b96b31f9c0e6a7b85f53ebbf98702ca95e"
  elsif OS.linux?
    url "https://github.com/magus/git-stack-cli/releases/download/1.3.6/git-stack-cli-linux"
    sha256 "5a1e50381f140447bd1edbb60fe50783c1be166331a8c5215c2474fbd98fb09a"
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
