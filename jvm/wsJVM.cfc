component {
	remote struct function getJVMstat()
		returnformat="JSON" {
		var result = {};
		var runtime = CreateObject("java","java.lang.Runtime").getRuntime();
		
		result.freememory = round(runtime.freeMemory()/1024^2);
		result.totalmemory = round(runtime.totalMemory()/1024^2);
		result.maxmemory = round(runtime.maxMemory()/1024^2);
		result.percentfreeallocated = round((result.freeMemory/result.totalMemory)*100);
		result.percentallocated = round((result.totalMemory/result.maxMemory)*100);
		
		writelog("freememory=#result.freememory# totalmemory=#result.totalmemory# maxmemory=#result.maxmemory# percentfreeallocated=#result.percentfreeallocated# percentallocated=#result.percentallocated#","information",false,"jvmstats");
		
		return result;
	}
}