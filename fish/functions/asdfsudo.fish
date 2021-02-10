function asdfsudo --description "Patched sudo with working asdf shims"
	set -l binary (asdf which $argv[1] || which $argv[1])
	sudo $binary $argv[2..-1]
end
