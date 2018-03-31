defmodule M do

	def main do
		#smax = IO.gets "Max "
		arr = IO.gets "input "
		arr = arr |> String.replace(~r/\r|\n/, "")
		#arr = "110011"
		arr = String.codepoints(arr)

		arr = Enum.map(arr, fn  x -> elem(Integer.parse(x), 0) end)

		peopleBeginning = arr |> Enum.sum

		arrIndex = arr |> Enum.with_index

		abc = Enum.reduce(arrIndex, 0, fn({x,i},acc) ->
			howmany = 0
			standingpeople = (Enum.take(arr,i) |> Enum.sum)
			IO.puts "shyness lvl: #{i} => #{x}     Acc = #{acc}    standingpeople = #{standingpeople}"
			if x>0 and i>standingpeople+acc do
					IO.puts "hago algo"
					invite = i - (Enum.take(arr,i) |> Enum.sum)
					IO.puts "Necesita invitarse personas: #{invite}"
					IO.puts "==========="
					howmany=invite
			end

			acc+howmany
		end)
	end
end
