function complex_sum(a::Array{Float64,1}, b::Array{Float64,1})

	return a+b
end

function complex_product(a::Array{Float64,1}, b::Array{Float64,1})

	return [a[1]*b[1]-a[2]*b[2], a[1]*b[2]+a[2]*b[1]]
end

function complex_sq(a::Array{Float64,1})

	return complex_product(a,a)
end

function mag(a::Array{Float64, 1})

	return sqrt(a[1]^2 + a[2]^2)

end

function test_value(a::Float64,b::Float64,c::Array{Float64,1})
	
	z = [a,b]
	counter = 0
	while (counter < 100)

		z = complex_sum(complex_sq(z),c)
		if mag(z) > 2
			return counter
		end
		counter += 1
	end
	return counter
end

x = -2.:0.01:2.
y = -2.:0.01:2.
c =  [-0.7269, 0.1889] #=[rand(1:1000)/1000., rand(1:1000)/1000.]

in_set_iteration = Array(Int, length(x), length(y))
for (i,a) in enumerate(x), (j,b) in enumerate(y)

	in_set_iteration[i,j] = test_value(a,b,c)

end

writedlm("out.txt",in_set_iteration)

