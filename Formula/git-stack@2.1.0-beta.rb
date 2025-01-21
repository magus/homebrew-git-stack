class GitStackAT210beta < Formula
  desc "Stacked diffs for git"
  homepage "https://github.com/magus/git-stack-cli"
  version "2.1.0-beta"

  if OS.mac?
    if Hardware::CPU.arm? || Hardware::CPU.in_rosetta2?
      url "https://github.com/magus/git-stack-cli/releases/download/2.1.0-beta/git-stack-bun-darwin-arm64.zip"
      sha256 "030efff049e3318dc33c95abc9768ec0e0d2274c4a323b6b3f52f6f707192309"

      def filename
        "git-stack-bun-darwin-arm64.zip"
      end
    else
      url "https://github.com/magus/git-stack-cli/releases/download/2.1.0-beta/git-stack-bun-darwin-x64.zip"
      sha256 "68fbc77e0aae9a465f8b27873dd94d409994c7991687ea395cba16b93649abb2"

      def filename
        "git-stack-bun-darwin-x64.zip"
      end
    end
  elsif OS.linux?
    url "https://github.com/magus/git-stack-cli/releases/download/2.1.0-beta/git-stack-bun-linux-x64.zip"
    sha256 "4aa0bf88e7adf482575daf4cb76d961f5a67fd4829e9fe7f135792c0e9992e55"

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
