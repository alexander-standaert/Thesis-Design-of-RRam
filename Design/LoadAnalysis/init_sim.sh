echo $1
rm -rf /tmp/s0211331-loadana/
mkdir /tmp/s0211331-loadana/
mkdir /tmp/s0211331-loadana/spice
cp ~/Thesis-Design-of-RRam/Design/technology_models/monte_carlo_models.scs /tmp/s0211331-loadana/spice/
cd ~/Thesis-Design-of-RRam/Design/
matlab -nodesktop -r "load_analysis()"

