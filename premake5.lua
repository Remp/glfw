project "GLFW"
	kind "StaticLib"
	language "C"
	staticruntime "off"

	targetdir ("%{wks.location}/bin/" .. outputdir .. "/%{prj.name}")
	objdir ("%{wks.location}/bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"include/GLFW/glfw3.h",
		"include/GLFW/glfw3native.h",
		"src/context.c",
		"src/init.c",
		"src/input.c",
		"src/monitor.c",
		"src/vulkan.c",
		"src/window.c"
	}

    filter "system:macosx"
        systemversion "12.1"
        pic "On"

        files
        {
            "src/cocoa_time.c",
            "src/posix_module.c",
            "src/posix_thread.c",
            "src/cocoa_init.m",
            "src/cocoa_joystick.m",
            "src/cocoa_monitor.m",
            "src/cocoa_window.m",
            "src/nsgl_context.m",
			"src/egl_context.c",
			"src/osmesa_context.c",
			"src/platform.c",
			"src/null_init.c",
			"src/null_window.c",
			"src/null_monitor.c",
			"src/null_joystick.c"
        }

        defines
        {
            "_GLFW_COCOA"
        }

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"
