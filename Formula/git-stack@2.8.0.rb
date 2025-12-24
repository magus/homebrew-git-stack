class GitStackAT280 < Formula
  desc "Stacked diffs for git"
  homepage "https://github.com/magus/git-stack-cli"
  version "2.8.0"

  if OS.mac?
    if Hardware::CPU.arm? || Hardware::CPU.in_rosetta2?
      url "https://github.com/magus/git-stack-cli/releases/download/2.8.0/git-stack-bun-darwin-arm64.zip"
      sha256 "04b611b89388b04ef190040cd584e571503e017d2bee3cc41250619eaf78f98c"

      def filename
        "git-stack-bun-darwin-arm64.zip"
      end
    else
      url "https://github.com/magus/git-stack-cli/releases/download/2.8.0/git-stack-bun-darwin-x64.zip"
      sha256 "25d4fb82b2067cea34edc7cde20d40d90d51ac456ae10d71b75dbfa4fb6db7f3"

      def filename
        "git-stack-bun-darwin-x64.zip"
      end
    end
  elsif OS.linux?
    url "https://github.com/magus/git-stack-cli/releases/download/2.8.0/git-stack-bun-linux-x64.zip"
    sha256 "435061ed78c344bb3dd72f62c0718fcd377ae7a93530b1ba45701ba7e9b2110f"

    def filename
      "git-stack-bun-linux-x64.zip"
    end
  else
    odie "Unsupported platform. Please submit a bug report here: https://github.com/magus/git-stack-cli/issues\n#{OS.report}"
  end

  # official Github CLI
  # https://cli.github.com/
  depends_on "gh"

  # git revise for faster, in-memory rebasing
  # https://github.com/mystor/git-revise
  depends_on "git-revise"

  def install
    binary_name = filename.sub(/\.zip$/, "")
    bin.install binary_name => "git-stack"
  end

  test do
    assert_match version, shell_output("#{bin}/git-stack --version")
    assert_match "Must be run from within a git repository.", shell_output("#{bin}/git-stack 2>&1", 9)
  end
end
