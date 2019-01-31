int IsEven(int n)
{
   if ((n%2) == 0)
      return 1;
   else 
      return 0;
}


int isPrime(int n)
{
    int i,k = 0;
        for(i=2;i<=n;i++)
        {
              if(n%i==0&&n!=i)
                  {
                    k=1;
                  }
        }
    if(k == 1)
        return 0;
    else
       return 1;
}

int op(int n)
{
int m;
	if(IsEven(n)==1)
		m=1;
	else 
		m=2;
return m;

}



int main()
{ 
   int n,num=343,res1,res2,res3,res4,res5,res6,l,m,back,front;
   int x = op(num);
   switch(x)
    {
       case 1:
         {		
           if(num == 2)
           res1 = 2;
           else
           res1 = num + 1;
           break;
         }
      case 2:
         {
		if(isPrime(num)==1)
		{
		res1=num+1;
		}
           	else
		{
			back=num-1;
			front=num+1;
			while(isPrime(front)!=1)
			{
				front++;
			}
			while(isPrime(back)!=1)
			{
				back--;
			}
			if(front-num>=back-num)
				res1=front;
			else
				res1=back;
		}
           	break;
         }
     }
	return 0;
}   
