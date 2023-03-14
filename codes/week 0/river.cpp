#include <vector>
#include <cstdlib>
#include <iostream>

using namespace std;
	
vector<pair<int, int>> pvec{{0, 1}, {1, 0}, {1, 1}, {2, 0}, {0, 2}};
vector<pair<int,int>> status;
int n;

void findWay(int num_mc, int num_fl, int times) {
	if (num_fl == 0 && num_mc == 0) {
		cout << "the process between the crossing river:"  << endl;
		int cnt = 0;
		for (auto iter = status.begin(); iter != status.end(); ++iter) {
			++cnt;
			if (cnt % 2) cout << "this time to go to the other side: ";
			else cout << "this time to come back this side";
			cout << iter->first << "  " << iter->second << endl;
		}
		return;
	}
	for (auto iter = pvec.begin(); iter != pvec.end(); ++iter) {
		int coeff = (times % 2) ? -1 : 1;
		auto lst_try = status[-1];
		if ( lst_try.first == iter->first && lst_try.second == iter->second ) continue; 
		auto this_mc = num_mc + coeff * iter->first;
		auto this_fl = num_fl + coeff * iter->second;
		auto that_mc = n - this_mc;
		auto that_fl = n - this_fl;
		if (this_mc >= this_fl && that_mc >= that_fl ) {
			cout << this_fl << " " << this_mc << endl;
			status.push_back(*iter);
			findWay(this_mc, this_fl, times + 1);
			status.pop_back();

		}

	}

}
int main(){

	cout << "Please input the number of the merchants:"<< endl;
	cin >> n;
	findWay(n, n, 1);
}