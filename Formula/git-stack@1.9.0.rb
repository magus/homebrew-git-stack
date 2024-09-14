class GitStackAT190 < Formula
  desc "Stacked diffs for git"
  homepage "https://github.com/magus/git-stack-cli"
  version "1.9.0"

  if OS.mac?
    url "https://github.com/magus/git-stack-cli/releases/download/1.9.0/git-stack-cli-macos"
    sha256 "413c1a92f89636f772da417d6bb95be53b17eb657c5ea947e5818daf47426e04"
  elsif OS.linux?
    url "https://github.com/magus/git-stack-cli/releases/download/1.9.0/git-stack-cli-linux"
    sha256 "145414f2763dd5bc458798fd4f86054a486cee4681dc9dd58fafe6d8524edf9c"
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
