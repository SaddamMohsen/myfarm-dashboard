import Link from "next/link"

export default function Footer() {
  return (
    <footer className=" text-melon-200 py-12">
      <div className="container mx-auto px-4">
      <footer className="w-full border-t border-t-foreground/10 p-8 flex justify-center text-center text-xs">
        <p>
          Powered by{" "}
          <a
            href="#"
            target="_blank"
            className="font-bold hover:underline"
            rel="noreferrer"
          >
            
            Saddam Escape
            &copy; {new Date().getFullYear()}
          </a>
        </p>
      </footer>
       
      </div>
    </footer>
  )
}

