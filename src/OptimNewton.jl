module OptimNewton

export get_root;
export optimize;

"""
	Try to find a root of (fun). You need to provide the first derivative of fun (fder) and an initial x0 value.	Additional parameters are used as stop signals.	xtol, ytol: are the tolerances for x and f(x) respectively, if further iteration do not	improve the result in more that this tolerance values, the method returns. itn: is the max number of iterations that the method will do. If verbose is true, the method will print a status message in every iteration.
"""
function get_root(x0, fun, fder; xtol = 10e-10, ytol = 10e-10,
 itn = 10, verbose = false)
	
	r = x0; 
	lastr = r;
	for i in 1:itn
		verbose && print("iteration $i: initial root $r,");
		r = r - fun(r)/fder(r);
		verbose && println(" oprox root $r");
		abs(lastr - r) <= xtol && break;
		lastr = r;
	end

	return r;

end # get_root

"""
	Try to find a optimus value of (fun). You need to provide the first derivative of fun (fder), de secund derivative of fun (sder) and an initial x0 value. Additional parameters are used as stop signals. xtol, ytol: are the tolerances for x and f(x) respectively, if further iteration do not	improve the result in more that this tolerance values, the method return. itn: is the max number of iterations that the method will do. If verbose is true, the method will print a status message in every iteration.
"""
function optimize(x0, fun, fder, sder; xtol = 10e-10, ytol = 10e-10, itn = 10, verbose = false)

	r = x0; 
	lastr = r;
	for i in 1:itn
		verbose && print("iteration $i: before value $r,");
		r = r - fder(r)/sder(r);
		verbose && println(" after value $r");
		abs(lastr - r) <= xtol && break;
		abs(fun(r) - fun(lastr)) <= ytol && break;
		lastr = r;
	end

	return r;

end # optimize

end # module
