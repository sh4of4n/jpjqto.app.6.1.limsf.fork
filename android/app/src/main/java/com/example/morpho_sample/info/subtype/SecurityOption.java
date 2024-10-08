// The present software is not subject to the US Export Administration Regulations (no exportation license required), May 2012
package com.example.morpho_sample.info.subtype;

public class SecurityOption
{
	public boolean	activated	= false;
	public String	title		= "";

	public SecurityOption(boolean activated, String title)
	{
		this.activated = activated;
		this.title = title;
	}

	public String toString(String no, String yes)
	{
		String act = no;
		if (activated)
			act = yes;
		return act + "\t" + title;
	}
}