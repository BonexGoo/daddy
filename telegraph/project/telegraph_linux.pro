!include(telegraph.pri) {
    error("BOSS2D : Couldn't find the telegraph.pri file...")
}

linux-g++{
	message("BOSS2D : The platform was decided to be linux-g++...")
} else {
        error("BOSS2D : You can not build on this platform!")
}
