ls "$PWD"/features/support/automation > files.txt
mkdir -p "$PWD"/report
rm -rf "$PWD"/status.txt
while read p; do	
	    s="$p"
	        echo $s
		    #s1=$(echo "$s" | awk -F'/' '{print $4}' | cut -d. -f1)
		        #echo "Value of s1-----$s1"
			test=$(bundle exec rspec features/support/automation/"$s")
                        echo "Value of test----$test"
                        test1=($(echo $test | grep -i '[^0] failures*'| grep -o '[[:digit:]]*'))
			
                        			
			    	if [ ${#test1[@]} -eq 0 ];then
			            printf "Test Case-- $s is PASS\n" >> "$PWD"/status.txt
				else
		                    printf "Test Case-- $s is FAIL\n" >> "$PWD"/status.txt
				fi
												    cp "$PWD"/rspec_results.html "$PWD"/report
												       # rm -rf "$PWD"/report/rspec_results_"$s".html
												           mv "$PWD"/report/rspec_results.html "$PWD"/report/rspec_results_"$s".html
												   done < files.txt
