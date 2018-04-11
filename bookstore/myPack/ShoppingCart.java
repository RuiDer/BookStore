package myPack;

/*购物车的具体实现，购物使用HashMap结构，key为bookId，值为ShoppingItem，实现add,remove，getItems,getNumberOfItems,getTatal*/

import java.util.*;
public class ShoppingCart {

	private HashMap<String,ShoppingCartItem> items=null;
	private int numberOfItems=0;
	
	public ShoppingCart(){
		items=new HashMap<String,ShoppingCartItem>();
	}
	
	public synchronized void add(String bookId,BookDetails book){
		if(items.containsKey(bookId))
		{
			ShoppingCartItem scitem=(ShoppingCartItem)items.get(bookId);
			scitem.incrementQuantity();
		}
		else
		{
			ShoppingCartItem scitem=new ShoppingCartItem(book);
			items.put(bookId,scitem);
		}
		numberOfItems++;
	}
	
	public synchronized void remove(String bookId){
		if(items.containsKey(bookId))
		{
			ShoppingCartItem scitem=(ShoppingCartItem)items.get(bookId);
			scitem.decrementQuantity();
			if(scitem.getQuantity()<=0){
				items.remove(bookId);
			}
			numberOfItems--;
		}
	}
	
	public synchronized Collection getItems(){
		return items.values();
	}
	
	protected void finalize() throws Throwable{
		items.clear();
	}
	
	public synchronized int getNumberOfItems(){
		return numberOfItems;
	}
	
	public synchronized double getTotal(){
		double amount=0;
		for(Iterator it=getItems().iterator();it.hasNext();){
			ShoppingCartItem item=(ShoppingCartItem)it.next();
			BookDetails bookDetails=(BookDetails)item.getItem();
			amount+=item.getQuantity()*bookDetails.getPrice();
		}
		return roundOff(amount);
	}
	
	private double roundOff(Double x){
		long val=Math.round(x*100);
		return val/100.0;
	}
	
	public synchronized void clear()
	{
		items.clear();
		numberOfItems=0;
	}
}
	

