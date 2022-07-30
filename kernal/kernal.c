void print_string(char* name)
{
	char* video_memory = (char*)0xb8000;
	int i = 0;
	while(name[i] != '\0')
	{
		*video_memory = name[i];
		i++;
		video_memory += 2;
	}
	return;
}

void print_x(char a)
{
	__asm__("movb %%al,(0xb8000)"::"a"(a));
}

void main()
{
	print_x('x');
	return ;
}