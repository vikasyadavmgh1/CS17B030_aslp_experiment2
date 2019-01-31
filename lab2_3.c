int main()
{
	int i,j,k,a[25],elements=0;
	for(i=2;i<100;i++)
	{
		k=0;
		for(j=2;j<i;j++)
		{
			if(i%j==0&&i!=j)
			{
				k=1;
			}
		}
		if(k==0)
		{
			a[elements]=i;
			elements++;
		}
	} 
	return 0;
}
