s="$1"
echo $s
s1=$(echo "$s" | awk -F'/' '{print $4}' | cut -d. -f1)
echo "Value of s1-----$s1"
mkdir -p "$PWD"/report
bundle exec rspec features/support/automation/"$s1".rb
cp "$PWD"/rspec_results.html "$PWD"/report
mv "$PWD"/report/rspec_results.html "$PWD"/report/rspec_results_"$s1".html