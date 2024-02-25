class GitStackAT104 < Formula
  desc "Stacked diffs for git"
  homepage "https://github.com/magus/git-stack-cli"
  version "1.0.4"

  if OS.mac?
    url "https://github.com/magus/git-stack-cli/releases/download/1.0.4/git-stack-cli-macos"
    sha256 "c1aff31701f51540367fc8dc3e6957926776a2806c4a5b366789488c770054f7"
  elsif OS.linux?
    url "https://github.com/magus/git-stack-cli/releases/download/1.0.4/git-stack-cli-linux"
    sha256 "05010ebed7cf531834ff7ddf51a835328722edcbea813b013a29b0405625496c"
  end

  def install
    bin.install "git-stack-cli-macos" => "git-stack" if OS.mac?
    bin.install "git-stack-cli-linux" => "git-stack" if OS.linux?
  end

  test do
    assert_match version, shell_output("#{bin}/git-stack --version")
    assert_match "Must be run from within a git repository.", shell_output("#{bin}/git-stack 2>&1", 9)
  end
end
