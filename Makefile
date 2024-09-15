./output/hello.txt: ./mytest/Sources/MyTest.swift
	if [ -f ./output/hello.txt ]; then rm ./output/hello.txt; fi
	if [ -d ./output ]; then rmdir ./output; fi
	swift run --package-path ./mytest