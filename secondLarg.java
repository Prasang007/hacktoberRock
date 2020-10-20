import java.util.Arrays;
 
public class MainClass
{
    static void secondLargest(int[] input)
    {
        int firstLargest, secondLargest;
  
        if(input[0] > input[1])
        {  
            firstLargest = input[0];
  
            secondLargest = input[1];
        }
        else
        {
  
            firstLargest = input[1];
  
            secondLargest = input[0];
        }

  
        for (int i = 2; i < input.length; i++) { if(input[i] > firstLargest)
            {
  
                secondLargest = firstLargest;
  
                firstLargest = input[i];
            }
            else if (input[i] < firstLargest && input[i] > secondLargest)
            {
  
                secondLargest = input[i];
            }
        }
  
        System.out.println("Input Array :");
         
        System.out.println(Arrays.toString(input));
         
        System.out.println("Second Largest Element : ");
         
        System.out.println(secondLargest);
    }
  
    public static void main(String[] args)
    {
        secondLargest(new int[] {47498, 14526, 74562, 42681, 75283, 45796});
    }
}