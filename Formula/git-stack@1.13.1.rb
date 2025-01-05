class GitStackAT1131 < Formula
  desc "Stacked diffs for git"
  homepage "https://github.com/magus/git-stack-cli"
  version "1.13.1"

  if OS.mac?
    url "https://github.com/magus/git-stack-cli/releases/download/1.13.1/git-stack-cli-macos"
    sha256 "fd8ecde3b06742d0308fc75f35f657e339803f2b7fe5f663326f0edff6d9ea4f"
  elsif OS.linux?
    url "https://github.com/magus/git-stack-cli/releases/download/1.13.1/git-stack-cli-linux"
    sha256 "144ec5d46e162af361e2de35562c5ebef45c34ba6c5f308eacd7397983906f79"
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
